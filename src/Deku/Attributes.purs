module Deku.Attributes
  ( klass
  , klass_
  , style
  , style_
  , id
  , id_
  ) where

import Prelude

import Deku.Attribute (class Attr, Attribute, (:=))
import Deku.DOM as D
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

klass
  :: forall e
   . Attr e D.Class String
  => AnEvent Zora String
  -> AnEvent Zora (Attribute e)
klass e = e <#> (D.Class := _)
klass_ :: forall t30. Attr t30 D.Class String => String -> AnEvent Zora (Attribute t30)
klass_ = klass <<< pure

style
  :: forall e
   . Attr e D.Style String
  => AnEvent Zora String
  -> AnEvent Zora (Attribute e)
style e = e <#> (D.Style := _)

style_ :: forall t13. Attr t13 D.Style String => String -> AnEvent Zora (Attribute t13)
style_ = style <<< pure

id
  :: forall e
   . Attr e D.Id String
  => AnEvent Zora String
  -> AnEvent Zora (Attribute e)
id e = e <#> (D.Id := _)
id_ :: forall t47. Attr t47 D.Id String => String -> AnEvent Zora (Attribute t47)
id_ = id <<< pure