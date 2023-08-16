module DOM.Indexed.Elements where

import Prelude
import Prim hiding (Type)

import DOM.Common (Element, typeArrayed, typeAttributed, typeEvented, typeNut, xhtmlNamespace)
import DOM.Indexed.Common (tagCtor)
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import PureScript.CST.Types (ClassFundep(..), Comment(..), Declaration, Export, Expr(..))
import Tidy.Codegen (declClass, declInstance, declSignature, declValue, exportValue, exprApp, exprArray, exprIdent, exprString, typeApp, typeArrow, typeCtor, typeRowEmpty, typeString, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

exports :: Partial => Array Element -> Array ( Export Void )
exports tags =
    bind tags \{ ctor } -> do
        let tag /\ shortHand = tagCtor ctor
        [ exportValue tag, exportValue shortHand ]

addComment :: String -> Expr Void -> Expr Void
addComment comment ( ExprString src v ) = 
    ExprString src { leadingComments = [ Comment $ "{- " <> comment <> " -}" ] } v
addComment _ expr = expr

generate :: Partial => Array Element -> Array ( Declaration Void )
generate tags =
    [ declClass [] "TagToDeku"
        [ typeVarKinded "tag" $ typeCtor "Symbol" 
        , typeVarKinded "interface" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ]
        ]
        [ FundepDetermines ( NEA.singleton ( toName "tag" ) ) tokRightArrow ( NEA.singleton ( toName "interface" ) ) ]
        []
    ]
    <> bind tags \{ ctor, tag, ns, interface } -> do
        let ctor /\ shortHand = tagCtor ctor
        [ declInstance Nothing [] "TagToDeku" [ typeString tag, typeApp ( typeCtor interface ) [ typeRowEmpty ] ] []
        , declSignature ctor
            $ typeArrow
                [ typeArrayed $ typeEvented $ typeAttributed $ typeApp ( typeCtor interface ) [ typeRowEmpty ]
                , typeApp ( typeCtor "Array" ) [ typeNut ]
                ]
                typeNut
        , declValue ctor [] $ exprApp ( exprIdent "elementify2" )
            [ addComment ( fromMaybe "" $ xhtmlNamespace ns ) $ exprString tag
            ]

        , declSignature shortHand
            $ typeArrow
                [ typeApp ( typeCtor "Array" ) [ typeNut ]
                ]
                typeNut
        , declValue shortHand [] $ exprApp ( exprIdent "elementify2" )
            [ addComment ( fromMaybe "" $ xhtmlNamespace ns ) $ exprString tag
            , exprArray []
            ]
        ]
