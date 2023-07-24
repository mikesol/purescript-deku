module DOM.Indexed where

import Prelude

import Control.Monad.Except (ExceptT(..))
import DOM.Common (Ctor, Specification, TagNS(..), TypeStub(..), namespaceBases, typeImports, webElements)
import DOM.Indexed.Common (requires)
import DOM.Indexed.Elements as Elements
import DOM.Indexed.Index as Index
import DOM.Indexed.Interfaces as Interfaces
import DOM.Indexed.Props as Props
import DOM.Indexed.Self as Self
import DOM.Indexed.Values as Values
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\))
import Effect.Aff (Aff, Error, attempt)
import FS as FS
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Export, ImportDecl)
import Tidy.Codegen (declImport, declImportAs, exportModule, importType, importValue, module_, printModule)

generateSpec :: String -> String -> Array ( ImportDecl Void ) -> Array ( Export Void ) -> Specification -> ExceptT Error Aff Unit
generateSpec path mod imports exports { keywords, elements, interfaces } = do
    let
        uniqueValues :: Array Values.Keyword
        uniqueValues =
            Array.nub $ map (\{ ctor, value } -> { ctor, value } ) keywords

        attributes :: Array ( Ctor /\ Array Props.AttributeType )
        attributes =
            Props.coalesceAttributes keywords interfaces

    ExceptT $ attempt
        $ writeTextFile UTF8 path
        $ printModule
        $ unsafePartial
        $ module_ mod
            ( Array.concat
                [ Interfaces.exports interfaces
                , Elements.exports elements
                , Props.exports attributes
                , Values.exports uniqueValues
                , exports
                ]
            )
            ( requires <> imports )
            ( Array.concat 
                [ Interfaces.generate interfaces
                , Elements.generate elements
                , Props.generate attributes
                , Values.generate uniqueValues
                ]
            )

generate :: Specification -> Specification -> Specification -> ExceptT Error Aff Unit
generate html svg mathml = do
    FS.createDir "lib/deku-dom-indexed/Deku/DOM/Indexed"

    ExceptT $ attempt
        $ writeTextFile UTF8  "./lib/deku-dom-indexed/Deku/DOM/Indexed/Index.purs"
        $ printModule
        $ unsafePartial
        $ module_ "Deku.DOM.Indexed.Index" []
            Index.imports
            Index.generate

    ExceptT $ attempt
        $ writeTextFile UTF8  "./lib/deku-dom-indexed/Deku/DOM/Indexed/Self.purs"
        $ printModule
        $ unsafePartial
        $ module_ "Deku.DOM.Indexed.Self" []
            ( Self.imports webElements )
            ( Self.generate webElements )

    generateSpec "./lib/deku-dom-indexed/Deku/DOM/Indexed.purs" "Deku.DOM.Indexed"
        ( typeImports [ TypeEventHandler, TypeString, TypeKeyword "" ]
            <> [ unsafePartial $ declImportAs "Deku.Control" [ importValue "text", importValue "text_" ] "Deku.Control" ]
        )
        [ unsafePartial $ exportModule "Deku.Control" ]
        html

    let
        globalImport :: Array String -> ImportDecl Void
        globalImport ctors =
            unsafePartial $ declImport "Deku.DOM.Indexed" $ map importType ctors

        svgDeps :: String -> Maybe String
        svgDeps "SvgGlobal" = Nothing
        svgDeps ctor = Just ctor

    generateSpec "./lib/deku-dom-indexed/Deku/DOM/Indexed/SVG.purs" "Deku.DOM.Indexed.SVG"
        ( Array.cons ( globalImport $ Array.mapMaybe svgDeps $ namespaceBases SVG )
            $ typeImports [ TypeEventHandler, TypeString, TypeKeyword "" ] 
        )
        []
        svg

    generateSpec "./lib/deku-dom-indexed/Deku/DOM/Indexed/MathML.purs" "Deku.DOM.Indexed.MathML"
        ( Array.cons ( globalImport $ namespaceBases MathML )
            $ typeImports [ TypeString ]
        )
        []
        mathml