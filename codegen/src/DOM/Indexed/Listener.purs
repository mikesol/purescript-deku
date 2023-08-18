module DOM.Indexed.Listener where

import Prelude
import Prim hiding (Type)

import DOM.Common (Event, attributeCtor, declHandler, typeAttributed, typeEvented, typeIndexedAt)
import DOM.TypeStub (constructArg, constructIndex, handler, handlerImports)
import Data.Array as Array
import Data.Tuple.Nested ((/\))
import PureScript.CST.Types (Declaration, Export, ImportDecl)
import Tidy.Codegen (binaryOp, declImport, declImportAs, declSignature, declValue, exportModule, exportValue, exprIdent, exprOp, importOp, importValue, typeArrow, typeForall, typeVar)

imports :: Partial => Array Event -> Array ( ImportDecl Void )
imports events =
    Array.concat
        [ identity
            [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
            , declImportAs "FRP.Event" [] "FRP.Event"
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
                    ]
                ) "Combinators"
            ]
        , handlerImports ( map _.type events )
        ]

exports :: Partial => Array Event -> Array ( Export Void )
exports events =
    Array.concat
        [ pure $ exportModule "Combinators" 
        , bind events \{ index } ->
            let ctor /\ shortHand = attributeCtor index
            in [ exportValue ctor, exportValue shortHand ]
        ]

generate :: Partial => Array Event -> Array ( Declaration Void )
generate events =
    bind events \{ index, type : t, name } ->
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
