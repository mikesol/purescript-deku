module DOM.Parse where

import Prelude
import Prim hiding (Type)

import DOM.Common (Attribute, Ctor(..), Element, Event, Interface, TagNS(..), mkAttribute, mkElement, mkHandler, mkInterface)
import DOM.IDL as IDL
import DOM.Spec as Spec
import DOM.TypeStub (TypeStub)
import Data.Array as Array
import Data.Function (on)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.String as String
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Data.Variant (Variant, match)
import Foreign.Object as Foreign
import Safe.Coerce (coerce)

type Source = Variant
    ( dfn :: Spec.KeywordSpec
    , events :: Spec.EventSpec
    , idlparsed :: Spec.InterfaceSpec
    , elements :: Spec.TagSpec
    )

type Specification =
    { attributes :: Array Attribute
    , events :: Array Event
    , interfaces :: Array Interface
    , elements :: Array Element
    }

-- | Sorts an array of definitions into a specification.
parse :: TagNS -> Array Source ->  Specification
parse ns sources = do
    let
        -- merge all chunks of Source into one record of arrays/objects to work with
        source ::
            { dfn :: Array Spec.Definition
            , event :: Array Spec.EventDef
            , inheritance :: Foreign.Object ( Array String )
            , members :: Foreign.Object ( Array Spec.Member )
            , extension :: Foreign.Object ( Array Spec.Mixin )
            , element :: Array Spec.Tag
            }
        source =
            Array.foldMap 
                ( match
                    { dfn : \{ dfns } -> empty { dfn = dfns }
                    , events : \{ events : evs } -> empty { event = evs }
                    , idlparsed : \{ idlparsed : { idlNames, idlExtendedNames } } ->
                        empty
                            { inheritance = map ( Array.fromFoldable <<< _.inheritance ) idlNames
                            , members = map ( maybe mempty identity <<< _.members ) idlNames 
                            , extension = idlExtendedNames
                            }
                            
                    , elements : \{ elements : els } -> empty { element = els }
                    }
                )
                sources
            
            where

            empty =
                { dfn : []
                , event : []
                , inheritance : Foreign.empty
                , members : Foreign.empty
                , extension : Foreign.empty
                , element : []
                }

        -- mapping of attribute to valid keywords
        keywords :: Foreign.Object ( Array String ) 
        keywords = do
            map Array.nub $ Foreign.fromFoldableWith append do
                dfn <- Array.filter ( not <<< eq "argument" <<< _.type ) source.dfn
                text <- dfn.linkingText
                for <- Array.nub $ Array.mapMaybe forAttribute dfn.for
                pure $ for /\ pure text

            where

            forAttribute :: String -> Maybe String
            forAttribute f =
                case String.split ( String.Pattern "/" ) f of
                    [ _, attr ] | attr /= "" ->
                        Just attr
                    
                    _ ->
                        Nothing

        elements :: Foreign.Object Element
        elements =
            Foreign.fromFoldable
                $ bind source.element case _ of
                    { name, interface : Just interface } ->
                        Tuple name <$> ( Array.fromFoldable $ mkElement ns interface name )
                    
                    _ ->
                        []

        -- we have the interface definitions in `interfaceSource` but those only contain properties. For SSR we need the 
        -- actual attributes and those only show up in the definitions as `element-attr`. 
        attributeMembers :: Foreign.Object ( Array Attribute )
        attributeMembers =
            Foreign.fromFoldableWith append
                $ bind source.dfn case _ of
                    -- basic attributes
                    { type : "element-attr", for, linkingText } -> do
                        attr <- flip Array.mapMaybe linkingText \attr ->
                            case String.stripPrefix ( String.Pattern "on" ) attr of
                                -- ignore "on" attributes for events, these are described better by the `EventSpec`
                                Just _ ->
                                    Nothing

                                Nothing ->
                                    Just attr

                        let kws =  keywordsFor attr
                        
                        attribute <- Array.fromFoldable $ mkAttribute kws attr
                        interface <- coerce $ map tagToInterface for
                        pure $ interface /\ pure attribute

                    -- could not find a definition for aria attributes so we translate the properties instead
                    { type : "attribute", for : [ "ARIAMixin" ], linkingText } ->
                        pure $ "ARIAMixin" /\ flip Array.mapMaybe linkingText \prop -> do
                            let attr = unAria prop
                                kws = keywordsFor attr 
                            mkAttribute kws attr
                    
                    -- css styling properties for svg
                    { type : "property", for :[], linkingText } | ns == SVG ->
                        pure $ "SVGElement" /\ flip Array.mapMaybe linkingText \prop -> do
                            let kws = keywordsFor prop
                            mkAttribute kws prop

                    { type : "property", for, linkingText } | ns == SVG -> do
                        prop <- linkingText
                        let kws = keywordsFor prop
                        attribute <- Array.fromFoldable $ mkAttribute kws prop
                        interface <- coerce $ tagToInterface <$> for
                        pure $ interface /\ pure attribute
                        
                    _ ->
                        []
            where

            -- dfn contains some pseudo interfaces which we have to map
            tagToInterface :: String -> Ctor
            tagToInterface "global" = Ctor "Element"
            tagToInterface "html-global" = Ctor "HTMLElement"
            tagToInterface "htmlsvg-global" = Ctor "HTMLOrSVGElement"
            tagToInterface tag = case Foreign.lookup tag elements of
                Just { interface } ->
                    interface

                Nothing ->
                    -- will throw either at generation or compilation
                    Ctor $ "!NoInterfaceFor" <> tag

            keywordsFor :: String -> Array String
            keywordsFor attr = 
                fromMaybe mempty $ Foreign.lookup attr keywords

            -- | Converts the property names of the ARIAMixin interface to the corresponding attribute name
            unAria :: String -> String
            unAria prop = case String.stripPrefix ( String.Pattern "aria" ) prop of
                Nothing -> 
                    prop -- "role" is not prefixed with aria

                Just rawAttr -> case rawAttr of
                    _ | Just elementStripped <- String.stripSuffix ( String.Pattern "Element" ) rawAttr ->
                        "aria-" <> String.toLower elementStripped

                    _ | Just elementsStripped <- String.stripSuffix ( String.Pattern "Elements" ) rawAttr ->
                        "aria-" <> String.toLower elementsStripped

                    _ ->
                        "aria-" <> String.toLower rawAttr

        -- the interface specifications do contain the events but not the interface of the emitted event itself. Those 
        -- can be found by running through the event specifications
        eventMembers :: Foreign.Object ( Array Event )
        eventMembers = 
            Foreign.fromFoldableWith append 
                $ bind source.event \{ type : name, targets, interface : eventType } -> do
                    interface <- targets
                    maybe mempty ( pure <<< Tuple interface <<< pure ) $ mkHandler eventType name
        
        interfaceMembers :: Foreign.Object ( Array ( Ctor /\ TypeStub ) )
        interfaceMembers =
            map ( Array.nub )
                $ Foreign.unionWith append ( extractMember attributeMembers ) ( extractMember eventMembers )

        -- the only thing we actually need the interface specifications for is the relation between interfaces. We need 
        -- to know which interface inherits, extends or mixes into another.
        interfaces :: Array Interface
        interfaces = do
            flip Array.mapMaybe ( Foreign.toUnfoldable source.members ) \( name /\ _ ) -> do
                let bases = Array.filter fixSpec ( IDL.resolveInterface source.inheritance source.extension name )
                    members = fromMaybe mempty $ Foreign.lookup name interfaceMembers 
                mkInterface bases members name

            where

            fixSpec = case _ of
                "LinkStyle" -> false
                _ -> true

        -- this would in theory leave out attributes with the same name but different types. In practice all attributes
        -- are stringly typed.
        attributes :: Array Attribute
        attributes =
            Array.nubBy ( compare `on` _.name ) $ Array.concat $ Foreign.values attributeMembers

        events :: Array Event
        events =
            Array.nubBy ( compare `on` _.name ) $ Array.concat $ Foreign.values eventMembers

    { attributes, events, elements : Foreign.values elements, interfaces }


extractMember :: forall f1 f2 r
        . Functor f1
    => Functor f2
    => f1 ( f2 { index :: Ctor, type :: TypeStub | r } )
    -> f1 ( f2 ( Ctor /\ TypeStub ) )
extractMember =
    map $ map \{ index, type : t } -> index /\ t