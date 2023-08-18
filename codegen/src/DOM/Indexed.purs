module DOM.Indexed where

import Prelude

import Comment (commentModule)
import Control.Monad.Except (ExceptT(..))
import DOM.Common (Interface, webElements)
import DOM.Indexed.Attribute as Attribute
import DOM.Indexed.Element as Element
import DOM.Indexed.Listener as Listener
import DOM.Indexed.Self as Self
import DOM.Parse (Specification)
import Data.Array as Array
import Data.Maybe (maybe)
import Data.String as String
import Effect.Aff (Aff, Error, attempt)
import FS as FS
import Foreign.Object as Foreign
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Node.Path as Path
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Export, ImportDecl, Module)
import Tidy.Codegen (declImportAs, exportModule, importValue, module_, printModule)

generateSpec ::
    String
    -> String
    -> Array ( ImportDecl Void )
    -> Array ( Export Void )
    -> Specification
    -> ExceptT Error Aff Unit
generateSpec path baseMod imports exports { elements, interfaces : all, attributes, events } = do
    let
        listenerMod :: String
        listenerMod =
            baseMod <> ".Listeners"
        
        attributeMod :: String
        attributeMod =
            baseMod <> ".Attributes"

        modPath :: String -> String
        modPath modName = do
            let segments = String.split ( String.Pattern "." ) modName
            Path.concat $ Array.concat
                [ pure path
                , maybe mempty identity $ Array.init segments
                , Array.fromFoldable $ map ( _ <> ".purs" ) $ Array.last segments
                ]

        interfaces :: Foreign.Object Interface
        interfaces =
            Element.crawlInterfaces elements all

    FS.createDir $ Path.concat [ path, String.replaceAll ( String.Pattern "." ) ( String.Replacement "/" ) baseMod ]

    ExceptT $ attempt
        $ writeTextFile UTF8 ( modPath baseMod )
        $ printModule
        $ unsafePartial
        $ warnCodegen
        $ module_ baseMod
            ( exports <> Element.exports interfaces elements )
            ( imports <> Element.imports "Deku.DOM" interfaces )
            ( Element.generate interfaces elements )

    when ( Array.length attributes /= 0 ) do
        ExceptT $ attempt
            $ writeTextFile UTF8 ( modPath attributeMod )
            $ printModule
            $ unsafePartial
            $ warnCodegen
            $ module_ attributeMod
                ( Attribute.exports attributes )
                ( Attribute.imports attributes )
                ( Attribute.generate attributes )

    when ( Array.length events /= 0 ) do
        ExceptT $ attempt
            $ writeTextFile UTF8 ( modPath listenerMod )
            $ printModule
            $ unsafePartial
            $ warnCodegen
            $ module_ listenerMod
                ( Listener.exports events )
                ( Listener.imports events )
                ( Listener.generate events )

warnCodegen :: forall a . Module a -> Module a
warnCodegen =
    commentModule
        [ "This module has been automatically generated by running `spago run -p codegen`."
        , "Any changes may be overwritten."
        ]

generate :: Specification -> Specification -> Specification -> ExceptT Error Aff Unit
generate html svg mathml = do
    FS.createDir "deku-dom/src/Deku/DOM"

    ExceptT $ attempt
        $ writeTextFile UTF8  "./deku-dom/src/Deku/DOM/Self.purs"
        $ printModule
        $ unsafePartial
        $ warnCodegen
        $ module_ "Deku.DOM.Self" []
            ( Self.imports webElements )
            ( Self.generate webElements )

    generateSpec "deku-dom/src" "Deku.DOM"
        [ unsafePartial $ declImportAs "Deku.Control" [ importValue "text", importValue "text_" ] "Deku.Control" ]
        [ unsafePartial $ exportModule "Deku.Control" ]
        html

    generateSpec "deku-dom/src" "Deku.DOM.SVG"
        []
        []
        svg

    generateSpec "deku-dom/src" "Deku.DOM.MathML"
        []
        []
        mathml