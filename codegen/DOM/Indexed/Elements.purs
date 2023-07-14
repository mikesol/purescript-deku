module DOM.Indexed.Elements where

import Prelude
import Prim hiding (Type)

import DOM.Common (escape, typeArrayed, typeAttributed, typeEvented, typeNut)
import DOM.Indexed.Common (tagName, typeIndexed)
import Data.Tuple.Nested ((/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Export)
import Tidy.Codegen (declSignature, declValue, exportValue, exprApp, exprArray, exprIdent, exprString, typeApp, typeArrow, typeCtor, typeRowEmpty)

exports :: Foreign.Object String -> Array ( Export Void )
exports tags =
    unsafePartial $ bind ( Foreign.keys tags ) \rawTag -> do
        let tag /\ shortHand = tagName rawTag
        [ exportValue tag, exportValue shortHand ]

generate :: Foreign.Object String -> Array ( Declaration Void )
generate tags = unsafePartial
    $ bind ( Foreign.toUnfoldable tags ) \( rawTag /\ interface ) -> do
        let tag /\ shortHand = tagName rawTag
            name = escape interface
        [ declSignature tag
            $ typeArrow
                [ typeArrayed $ typeEvented $ typeAttributed $ typeIndexed $ typeApp ( typeCtor name ) [ typeRowEmpty ]
                , typeApp ( typeCtor "Array" ) [ typeNut ]
                ]
                typeNut
        , declValue tag [] $ exprApp ( exprIdent "elementify2" )
            [ exprString tag
            ]

        , declSignature shortHand
            $ typeArrow
                [ typeApp ( typeCtor "Array" ) [ typeNut ]
                ]
                typeNut
        , declValue shortHand [] $ exprApp ( exprIdent "elementify2" )
            [ exprString tag
            , exprArray []
            ]
        ]
