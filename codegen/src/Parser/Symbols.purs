module Parser.Symbols where

import Prelude
import Prim hiding (Type)

import Data.String.CodeUnits as String
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Type)
import Tidy.Codegen (typeApp, typeCtor, typeString, typeVar)

cons :: Type Void -> Type Void -> Type Void -> Type Void
cons h t symbol = unsafePartial $
  typeApp (typeCtor "Sym.Cons") [ h, t, symbol ]

rlcons :: Type Void -> Type Void -> Type Void -> Type Void
rlcons k v t = unsafePartial $
  typeApp (typeCtor "RL.Cons") [ k, v, t ]

append :: Type Void -> Type Void -> Type Void -> Type Void
append l r a = unsafePartial $
  typeApp (typeCtor "Sym.Append") [ l, r, a ]

typeFalse :: Type Void
typeFalse =
  unsafePartial $ typeCtor "False"

typeTrue :: Type Void
typeTrue =
  unsafePartial $ typeCtor "True"

whitespace :: Array (Type Void)
whitespace =
  typeString <$> [ " ", "\t", "\n" ]

typeArrayFromString :: String -> Array (Type Void)
typeArrayFromString =
  map (typeString <<< String.singleton) <<< String.toCharArray

lowerCase :: Array (Type Void)
lowerCase =
  typeArrayFromString "abcdefghijklmnopqrstuvwxyz"

upperCase :: Array (Type Void)
upperCase =
  typeArrayFromString "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

letters :: Array (Type Void)
letters =
  lowerCase <> upperCase

punctuation :: Array (Type Void)
punctuation =
  typeArrayFromString ":,;\'!?@#$%^&*()_-=`~<>/."

digits :: Array (Type Void)
digits =
  typeArrayFromString "0123456789"

purs :: Type Void
purs =
  unsafePartial $ typeVar "purs"

path :: Type Void
path =
  unsafePartial $ typeVar "path"

pursx :: Type Void
pursx =
  unsafePartial $ typeVar "pursx"


pathx :: Type Void
pathx =
  unsafePartial $ typeVar "pathx"

onezero :: Type Void
onezero =
  unsafePartial $ typeVar "onezero"

pursi :: Type Void
pursi =
  unsafePartial $ typeVar "pursi"

purso :: Type Void
purso =
  unsafePartial $ typeVar "purso"

pathi :: Type Void
pathi =
  unsafePartial $ typeVar "pathi"

patho :: Type Void
patho =
  unsafePartial $ typeVar "patho"

tail :: Type Void
tail =
  unsafePartial $ typeVar "tail"

trailing :: Type Void
trailing =
  unsafePartial $ typeVar "trailing"

x :: Type Void
x =
  unsafePartial $ typeVar "x"

y :: Type Void
y =
  unsafePartial $ typeVar "y"

xx :: Type Void
xx =
  unsafePartial $ typeVar "xx"

yy :: Type Void
yy =
  unsafePartial $ typeVar "yy"

verb :: Type Void
verb =
  unsafePartial $ typeVar "verb"

hasAttributed :: Type Void
hasAttributed =
  unsafePartial $ typeVar "hasAttributed"

tag :: Type Void
tag =
  unsafePartial $ typeVar "tag"

otag :: Type Void
otag =
  unsafePartial $ typeVar "otag"

tag_ :: Type Void
tag_ =
  unsafePartial $ typeVar "tag_"

isSingleWhitespaceClass :: Type Void
isSingleWhitespaceClass =
  unsafePartial $ typeCtor "IsSingleWhiteSpace"

pxStartClass :: Type Void
pxStartClass =
  unsafePartial $ typeCtor "PXStart"

pxTagPreNameClass :: Type Void
pxTagPreNameClass =
  unsafePartial $ typeCtor "PXTagPreName"

pxTagNameClass :: Type Void
pxTagNameClass =
  unsafePartial $ typeCtor "PXTagName"

preEndTagFromTrailingClass :: Type Void
preEndTagFromTrailingClass =
  unsafePartial $ typeCtor "PreEndTagFromTrailing"

endTagFromTrailingClass :: Type Void
endTagFromTrailingClass =
  unsafePartial $ typeCtor "EndTagFromTrailing"

pxTagPreAttrNameClass :: Type Void
pxTagPreAttrNameClass =
  unsafePartial $ typeCtor "PXTagPreAttrName"

pxBodyClass :: Type Void
pxBodyClass =
  unsafePartial $ typeCtor "PXBody"

pxTagAttrNameClass :: Type Void
pxTagAttrNameClass =
  unsafePartial $ typeCtor "PXTagAttrName"

pxTagPostAttrNameClass :: Type Void
pxTagPostAttrNameClass =
  unsafePartial $ typeCtor "PXTagPostAttrName"

pxTagPreAttrValueClass :: Type Void
pxTagPreAttrValueClass =
  unsafePartial $ typeCtor "PXTagPreAttrValue"

pxTagAttrValueClass :: Type Void
pxTagAttrValueClass =
  unsafePartial $ typeCtor "PXTagAttrValue"

doVerbForAttrClass :: Type Void
doVerbForAttrClass =
  unsafePartial $ typeCtor "DoVerbForAttr"