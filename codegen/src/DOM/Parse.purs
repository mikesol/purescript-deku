module DOM.Parse where

import Prelude
import Prim hiding (Type)

import DOM.Common (Attribute, Ctor(..), Element, Interface, Keyword, TagNS(..), mkAttribute, mkElement, mkHandler, mkInterface, mkKeyword, namespaceBases, tagToInterface)
import DOM.Spec (Definition)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.String as String
import Data.Tuple (uncurry)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign

type Specification =
    { keywords :: Array Keyword
    , interfaces :: Array Interface
    , elements :: Array Element
    }

-- | Sorts an array of definitions into a specification.
parse :: TagNS -> Array Definition -> Specification
parse ns defs = do
    let
        keywords :: Array Keyword
        keywords =
            Array.mapMaybe ( uncurry mkKeyword ) do
                dfn <- Array.filter ( not <<< eq "argument" <<< _.type ) defs
                text <- dfn.linkingText
                for <- Array.nub $ Array.mapMaybe forAttribute dfn.for
                pure $ for /\ text

            where

            forAttribute :: String -> Maybe String
            forAttribute f =
                case String.split ( String.Pattern "/" ) f of
                    [ _, attr ] | attr /= "" ->
                        Just attr
                    
                    _ ->
                        Nothing

        elements :: Array Element
        elements =
            bind defs case _ of
                { type : "element", linkingText } ->  
                    Array.mapMaybe ( mkElement ns ) linkingText
                
                _ ->
                    []

        interfaceMembers :: Foreign.Object ( Array Attribute )
        interfaceMembers =
            Foreign.fromFoldableWith append do
                bind defs case _ of
                    -- basic attributes
                    { type : "element-attr", for, linkingText } -> do
                        let
                            filtered = flip Array.mapMaybe linkingText \attr ->
                                    case String.stripPrefix ( String.Pattern "on" ) attr of
                                        Just eventName ->
                                            mkHandler eventName
                                        Nothing ->
                                            mkAttribute attr
                        
                        map ( ( _ /\  filtered ) <<< tagToInterface ns ) for

                    -- could not find a definition for aria attributes so we translate the properties instead
                    { type : "attribute", for : [ "ARIAMixin" ], linkingText } -> do
                        [ "ARIAMixin" /\ Array.mapMaybe ( mkAttribute <<< unAria ) linkingText ]
                    
                    -- detect event handler attributes
                    { type : "attribute", for, linkingText } -> do
                        let filtered =
                                flip Array.mapMaybe linkingText
                                    $ mkHandler <=< String.stripPrefix ( String.Pattern "on" )
                        
                        if filtered == [] then [] else map ( _ /\ filtered ) for

                    -- css styling properties for svg
                    { type : "property", for :[], linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe mkAttribute linkingText
                        [ "SvgGlobal" /\ members ]

                    { type : "property", for, linkingText } | ns == SVG -> do
                        let members = Array.mapMaybe mkAttribute linkingText
                        map ( ( _ /\ members ) <<< tagToInterface ns ) for

                    _ ->
                        []
            where

            -- | Converts the property name of the ARIAMixin interface to the corresponding attribute name
            unAria :: String -> String
            unAria prop = case String.stripPrefix ( String.Pattern "aria" ) prop of
                Nothing -> 
                    prop -- role is not prefixed with aria

                Just rawAttr -> case rawAttr of
                    _ | Just elementStripped <- String.stripSuffix ( String.Pattern "Element" ) rawAttr ->
                        "aria-" <> String.toLower elementStripped

                    _ | Just elementsStripped <- String.stripSuffix ( String.Pattern "Elements" ) rawAttr ->
                        "aria-" <> String.toLower elementsStripped

                    _ ->
                        "aria-" <> String.toLower rawAttr
        
        elementInterfaces :: Foreign.Object ( Array Attribute )
        elementInterfaces =
            Foreign.fromFoldable $ map (\{ interface : Ctor intf } -> intf /\ [] ) elements

        interfaces :: Array Interface
        interfaces = do
            let
                referenced :: Array String
                referenced =
                    Foreign.keys elementInterfaces <> namespaceBases ns

                filtered :: Array ( String /\ Array Attribute )    
                filtered =
                    Foreign.toUnfoldable
                        $ Foreign.filterKeys ( _ `Array.elem` referenced )
                        $ Foreign.union interfaceMembers elementInterfaces
            
            flip Array.mapMaybe filtered \( name /\ members ) ->
                mkInterface ns name members
                
    { keywords
    , elements
    , interfaces
    }