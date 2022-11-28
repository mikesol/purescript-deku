module Deku.Attributes
  ( href
  , href_
  , id
  , id_
  , klass
  , klass_
  , style
  , style_
  )
  where

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

klass_ :: forall t30. Attr t30 D.Class String => String -> Event (Attribute t30)
klass_ = klass <<< pure

style
  :: forall e
   . Attr e D.Style String
  => Event String
  -> Event (Attribute e)
style e = e <#> (D.Style := _)

style_ :: forall t13. Attr t13 D.Style String => String -> Event (Attribute t13)
style_ = style <<< pure

id
  :: forall e
   . Attr e D.Id String
  => Event String
  -> Event (Attribute e)
id e = e <#> (D.Id := _)

id_ :: forall t47. Attr t47 D.Id String => String -> Event (Attribute t47)
id_ = id <<< pure

href
  :: forall e
   . Attr e D.Href String
  => Event String
  -> Event (Attribute e)
href e = e <#> (D.Href := _)

href_ :: forall t47. Attr t47 D.Href String => String -> Event (Attribute t47)
href_ = href <<< pure