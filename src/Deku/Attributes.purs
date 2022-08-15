module Deku.Attributes
  ( klass
  , style
  , id
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

style
  :: forall e
   . Attr e D.Style String
  => AnEvent Zora String
  -> AnEvent Zora (Attribute e)
style e = e <#> (D.Style := _)

id
  :: forall e
   . Attr e D.Id String
  => AnEvent Zora String
  -> AnEvent Zora (Attribute e)
id e = e <#> (D.Id := _)

