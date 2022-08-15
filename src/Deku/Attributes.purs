module Deku.Attributes
  ( klass
  , style
  , id
  ) where

import Prelude

import Deku.Attribute (class Attr, Attribute, (:=))
import Deku.DOM as D
import FRP.Event (AnEvent)

klass :: forall e m. Attr e D.Class String => AnEvent m String -> AnEvent m (Attribute e)
klass e = e <#> (D.Class := _)
style :: forall e m. Attr e D.Style String => AnEvent m String -> AnEvent m (Attribute e)
style e = e <#> (D.Style := _)
id :: forall e m. Attr e D.Id String => AnEvent m String -> AnEvent m (Attribute e)
id e = e <#> (D.Id := _)

