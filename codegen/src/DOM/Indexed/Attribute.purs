module DOM.Indexed.Attribute where

import Prelude
import Prim hiding (Type)

import DOM.Common (Attribute, declHandler, typeAttributed, typeEvented, attributeCtor, typeIndexedAt)
import DOM.TypeStub (constructArg, constructIndex, handler, handlerImports)
import Data.Array as Array
import Data.Tuple.Nested ((/\))
import PureScript.CST.Types (Declaration, Export, ImportDecl)
import Tidy.Codegen (binaryOp, declImport, declImportAs, declSignature, declValue, exportModule, exportValue, exprApp, exprIdent, exprOp, exprString, importOp, importValue, typeArrow, typeForall, typeVar)

imports :: Partial => Array Attribute -> Array ( ImportDecl Void )
imports attributes =
    Array.concat
        [ identity
            [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
            , declImportAs "FRP.Event" [] "FRP.Event"
            , declImportAs "Deku.DOM.Combinators" [ importValue "unset" ] "Combinators"
            ]
        , handlerImports ( map _.type attributes )
        ]

exports :: Partial => Array Attribute -> Array ( Export Void )
exports attributes =
    Array.concat
        [ pure $ exportModule "Combinators"
        , bind attributes \{ index, keywords } ->
            let ctor /\ shortHand = attributeCtor index
            in [ exportValue ctor, exportValue shortHand ] <> map ( exportValue <<< append ctor <<< _.name ) keywords
        ]

generate :: Partial => Array Attribute -> Array ( Declaration Void )
generate attributes =
    bind attributes \{ index, type : t, keywords, name } ->
        let ctor /\ shortHand = attributeCtor index
            indexType = constructIndex t
        in
            -- generate simple function definition
            [ declSignature ctor
                $ typeForall [ typeVar "r" ]
                $ typeArrow [ typeEvented $ constructArg t ]
                $ typeEvented $ typeAttributed $ typeIndexedAt index indexType
            , declHandler ctor name $ handler t

            , declSignature shortHand 
                $ typeForall [ typeVar "r" ]
                $ typeArrow [ constructArg t ]
                $ typeEvented $ typeAttributed $ typeIndexedAt index indexType
            , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
            ]
            -- create additional shorthands for known keywords
            <> bind keywords ( generateKeywordShorthand ctor shortHand index indexType )

    where
        
    generateKeywordShorthand ctor shortHand index indexType { original, name } = do
        let valueName = ctor <> name
        [ declSignature valueName 
                $ typeForall [ typeVar "r" ]
                $ typeEvented $ typeAttributed $ typeIndexedAt index $ indexType
        , declValue valueName [] $ exprApp ( exprIdent shortHand ) [ exprString original ] 
        ]