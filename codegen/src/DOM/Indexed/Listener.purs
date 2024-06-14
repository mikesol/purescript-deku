module DOM.Indexed.Listener where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), Event, declHandler, typeAttributed, typeFunked, typeIndexedAt)
import DOM.TypeStub (constructArg, constructIndex, handler, handlerImports)
import Data.Array as Array
import PureScript.CST.Types (Declaration, Export, ImportDecl)
import Tidy.Codegen (binaryOp, declImport, declImportAs, declSignature, declValue, exportModule, exportValue, exprIdent, exprOp, importClass, importOp, importValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeVar)

imports :: Partial => Array Event -> Array ( ImportDecl Void )
imports events =
    Array.concat
        [ identity
            [ declImportAs "Control.Applicative" [ importValue "pure", importClass "Applicative" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map", importClass "Functor" ] "Functor"
            , declImportAs "Deku.DOM.Combinators"
                ( map importValue
                    [ "unset"
                    , "injectElement"
                    , "injectElementT"
                    , "runOn"
                    , "runOn_"
                    , "numberOn"
                    , "numberOn_"
                    , "checkedOn"
                    , "checkedOn_"
                    , "valueOn"
                    , "valueOn_"
                    , "selectOn"
                    , "selectOn_"
                    ]
                ) "Combinators"
            ]
        , handlerImports ( map _.type events )
        ]

exports :: Partial => Array Event -> Array ( Export Void )
exports events =
    Array.concat
        [ pure $ exportModule "Combinators" 
        , bind events \{ index : Ctor ctor } ->
            let shortHand = ctor <> "_"
            in [ exportValue ctor, exportValue shortHand ]
        ]

generate :: Partial => Array Event -> Array ( Declaration Void )
generate events =
    bind events \{ index : index@( Ctor ctor ), type : t, name } ->
        let shortHand = ctor <> "_"
            indexType = constructIndex t
        in
            -- generate simple function definition
            [ declSignature ctor
                $ typeForall [ typeVar "r", typeVar "f" ]
                $ typeConstrained [ typeApp ( typeCtor "Functor.Functor" ) [ typeVar "f"  ] ]
                $ typeArrow [ typeFunked "f" $ constructArg t ]
                $ typeFunked "f" $ typeAttributed $ typeIndexedAt index indexType
            , declHandler ctor $ handler name t

            , declSignature shortHand 
                $ typeForall [ typeVar "r", typeVar "f" ]
                $ typeConstrained [ typeApp ( typeCtor "Applicative.Applicative" ) [ typeVar "f"  ] ]
                $ typeArrow [ constructArg t ]
                $ typeFunked "f" $ typeAttributed $ typeIndexedAt index indexType
            , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
            ]
