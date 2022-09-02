module Deku.Attributes
  ( klass
  , style
  , id
  ) where

import Prelude

import Deku.Attribute (class Attr, Attribute, (:=))
import Deku.DOM as D
import FRP.Event (Event)


klass
  :: forall e
   . Attr e D.Class String
  => Event String
  -> Event (Attribute e)
klass e = e <#> (D.Class := _)

style
  :: forall e
   . Attr e D.Style String
  => Event String
  -> Event (Attribute e)
style e = e <#> (D.Style := _)

id
  :: forall e
   . Attr e D.Id String
  => Event String
  -> Event (Attribute e)
id e = e <#> (D.Id := _)

