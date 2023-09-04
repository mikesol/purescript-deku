-- | Reads the existing implementation from `Parser/Pursx.purs_` and augments it with more cases covering all necessary
-- | codepoints.
-- TODO: implement parser generator for the type level
module Parser where

import Parser.Symbols
import Prim hiding (Type)

import Control.Monad.Except (ExceptT(..), except)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Either (Either(..))
import Data.Foldable (intercalate)
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff, Error, attempt, error)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile, writeTextFile)
import Partial.Unsafe (unsafePartial)
import Prelude (Unit, Void, bind, flip, map, show, ($), (<>), (==))
import PureScript.CST (RecoveredParserResult(..), parseModule)
import PureScript.CST.Errors (ParseError, printParseError)
import PureScript.CST.Types (ClassHead, Declaration(..), Module(..), ModuleBody(..), Name(..), Proper(..), QualifiedName(..), Type(..))
import Tidy.Codegen (declInstance, declInstanceChain, printModule, typeApp, typeString, typeVar)

generate :: ExceptT Error Aff Unit
generate = do
    classBaseText <- ExceptT $ attempt $ readTextFile UTF8 "./codegen/src/Parser/Pursx.purs_"

    classBase <- except $ fromParseResult $ parseModule classBaseText

    ExceptT $ attempt
        $ writeTextFile UTF8 "./deku-core/src/Deku/Pursx.purs"
        $ printModule
        $ unsafePartial
        $ rewriteModule classBase

    where

    fromParseResult :: forall r . RecoveredParserResult r -> Either Error ( r Void )
    fromParseResult = case _ of
        ParseSucceeded cst ->
            Right cst

        ParseSucceededWithErrors _ es ->
            Left $ error $ intercalate "\n" $ map printError es 

        ParseFailed es ->
            Left $ error $ printError es 
    
    printError :: { error :: ParseError, position :: { line :: Int, column :: Int } } -> String
    printError { error, position : { line, column } } =
        show line <> ":" <> show column <> " " <> printParseError error

rewriteModule :: Module Void -> Module Void
rewriteModule ( Module mod ) = Module mod { body = rewriteBody mod.body }

rewriteBody :: ModuleBody Void -> ModuleBody Void
rewriteBody ( ModuleBody body ) = ModuleBody body { decls = expandClasses body.decls }

isClass :: ClassHead Void -> Type Void -> Boolean
isClass { name : Name { name : Proper l } } ( TypeConstructor ( QualifiedName { name : Proper r, module : Nothing } ) ) =
    l == r
isClass _ _ =
    false

expandClasses :: Array ( Declaration Void ) -> Array ( Declaration Void )
expandClasses decls = unsafePartial $ bind decls \decl -> case decl of
    DeclClass head _ | isClass head isSingleWhitespaceClass ->
        Array.cons decl $ isSingleWhitespace head

    DeclClass head _ | isClass head pxStartClass ->
        Array.cons decl $ pxStart head

    DeclClass head _ | isClass head pxTagPreNameClass ->
        Array.cons decl $ pxTagPreName head

    DeclClass head _ | isClass head pxTagNameClass ->
        Array.cons decl $ pxTagName head

    DeclClass head _ | isClass head endTagFromTrailingClass ->
        Array.cons decl $ endTagFromTrailing head
        
    DeclClass head _ | isClass head preEndTagFromTrailingClass ->
        Array.cons decl $ preEndTagFromTrailing head

    DeclClass head _ | isClass head pxTagPreAttrNameClass ->
        Array.cons decl $ pxTagPreAttrName head

    DeclClass head _ | isClass head pxTagAttrNameClass ->
        Array.cons decl $ pxTagAttrName head

    DeclClass head _ | isClass head pxTagPostAttrNameClass ->
        Array.cons decl $ pxTagPostAttrName head

    DeclClass head _ | isClass head pxTagPreAttrValueClass ->
        Array.cons decl $ pxTagPreAttrValue head

    DeclClass head _ | isClass head pxTagAttrValueClass ->
        Array.cons decl $ pxTagAttrValue head

    _ ->
        [ decl ]

isSingleWhitespace :: ClassHead Void -> Array ( Declaration Void )
isSingleWhitespace { name } =
    flip map whitespace \ws ->
        declInstance Nothing [] name [ ws ] []

pxStart :: ClassHead Void -> Array ( Declaration Void )
pxStart { name } =
    flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxStartClass [ verb, x, y, purs ]
            ]
            name
            [ verb, ws, tail, purs ]
            []


pxTagPreName :: ClassHead Void -> Array ( Declaration Void )
pxTagPreName { name } = Array.concat
    [ flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagPreNameClass [ verb, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, ws, tail, pursi, purso, trailing ]
            []
    , flip map lowerCase \match ->
        declInstance Nothing
            [ typeApp pxTagNameClass [ verb, typeString "", match, tail, pursi, purso, trailing ] ]
            name
            [ verb, match, tail, pursi, purso, trailing ]
            []
    ]

pxTagName :: ClassHead Void -> Array ( Declaration Void )
pxTagName { name } = Array.concat
    [ flip map ( lowerCase <> [ typeString  "-" ] <> digits ) \match ->
        declInstance Nothing
            [ cons x y tail
            , append tag_ match tag
            , typeApp pxTagNameClass [ verb, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, tag_, match, tail, pursi, purso, trailing ]
            []
    , flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagPreAttrNameClass [ verb, typeFalse, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, tag, ws, tail, pursi, purso, trailing ]
            []
    ]

preEndTagFromTrailing :: ClassHead Void -> Array ( Declaration Void )
preEndTagFromTrailing { name } = Array.concat
    [ flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp preEndTagFromTrailingClass [ x, y, tag, trailing ]
            ]
            name
            [ ws, tail, tag, trailing ]
            []
    , flip map ( lowerCase <> [ typeString "-" ] ) \match ->
        declInstance Nothing
            [ typeApp endTagFromTrailingClass [ match, tail, typeString "", tag, trailing ] ]
            name
            [ match, tail, tag, trailing ]
            []
    ]

endTagFromTrailing :: ClassHead Void -> Array ( Declaration Void )
endTagFromTrailing { name } =
    flip map ( lowerCase <> [ typeString  "-" ] <> digits ) \match ->
        declInstance Nothing
            [ cons x y tail
            , append tag_ match tag
            , typeApp endTagFromTrailingClass [ x, y, tag, otag, trailing ]
            ]
            name
            [ match, tail, tag_, otag, trailing ]
            []

pxTagPreAttrName :: ClassHead Void -> Array ( Declaration Void )
pxTagPreAttrName { name } =
    [ declInstanceChain 
        $ NEA.prependArray
            [ declInstance Nothing
                [ cons ( typeString ">" ) trailing tail ]
                name 
                [ verb, hasAttributed, tag, typeString "/", tail, purs, purs, trailing ]
                []
            , declInstance Nothing
                [ cons q r tail
                , typeApp pxBodyClass [ verb, q, r, pursi, purso, trailing ]
                , cons x y trailing
                , typeApp preEndTagFromTrailingClass [ x, y, tag, newTrailing ]
                ]
                name
                [ verb, hasAttributed, tag, typeString ">", tail, pursi, purso, newTrailing ]
                []
            ]
        $ NEA.prependArray
            ( flip map whitespace \ws ->
                declInstance Nothing
                    [ cons x y tail
                    , typeApp pxTagPreAttrNameClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
                    ]
                    name
                    [ verb, hasAttributed, tag, ws, tail, pursi, purso, trailing ]
                    []
            )
        $ NEA.prependArray
            ( flip map letters \match ->
                declInstance Nothing
                    [ typeApp pxTagAttrNameClass [ verb, hasAttributed, tag, match, tail, pursi, purso, trailing ] ]
                    name
                    [ verb, hasAttributed, tag, match, tail, pursi, purso, trailing ]
                    []
            )
        $ NEA.singleton
        $ declInstance Nothing
            [ cons x y tail
            , typeApp doVerbForAttrClass [ verb, tag, typeString "", x, y, pursi, pursx, newTail ]
            , cons xx yy newTail
            , typeApp pxTagPreAttrNameClass [ verb, typeTrue, tag, xx, yy, pursx, purso, trailing ]
            ]
            name
            [ verb, typeFalse, tag, verb, tail, pursi, purso, trailing ]
            []
    ]
    
    where
    -- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"
    newTrailing = unsafePartial $ typeVar "newTrailing"
    q  = unsafePartial $ typeVar "q"
    r = unsafePartial $ typeVar "r"

    newTail = unsafePartial $ typeVar "newTail"

pxTagAttrName :: ClassHead Void -> Array ( Declaration Void )
pxTagAttrName { name } = Array.concat
    [ flip map ( lowerCase <> upperCase <> [ typeString "-" ] <> digits ) \match ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagAttrNameClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, hasAttributed, tag, match, tail, pursi, purso, trailing ]
            []
    , flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagPostAttrNameClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, hasAttributed, tag, ws, tail, pursi, purso, trailing ]
            []
    ]

pxTagPostAttrName :: ClassHead Void -> Array ( Declaration Void )
pxTagPostAttrName { name } =
    flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagPostAttrNameClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, hasAttributed, tag, ws, tail, pursi, purso, trailing ]
            []

pxTagPreAttrValue :: ClassHead Void -> Array ( Declaration Void )
pxTagPreAttrValue { name } =
    flip map whitespace \ws ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagPreAttrValueClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, hasAttributed, tag, ws, tail, pursi, purso, trailing ]
            []

pxTagAttrValue :: ClassHead Void -> Array ( Declaration Void )
pxTagAttrValue { name } =
    flip map ( lowerCase <> upperCase <> digits <> punctuation <> [ typeString "\\" ] <> whitespace ) \match ->
        declInstance Nothing
            [ cons x y tail
            , typeApp pxTagAttrValueClass [ verb, hasAttributed, tag, x, y, pursi, purso, trailing ]
            ]
            name
            [ verb, hasAttributed, tag, match, tail, pursi, purso, trailing ]
            []