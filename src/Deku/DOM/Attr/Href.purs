module Deku.DOM.Attr.Href where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Href = Href

instance Attr A_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Area_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Base_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Link_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Image_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr LinearGradient_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Pattern_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr RadialGradient_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr TextPath_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Use_ Href String where
  attr Href bothValues = unsafeAttribute $ Both
    { key: "href", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "href", value: prop' value })
  pureAttr Href value = unsafeAttribute $ This
    { key: "href", value: prop' value }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr everything Href Unit where
  attr Href bothValues = unsafeAttribute $ Both { key: "href", value: unset' }
    (snd bothValues <#> \_ -> { key: "href", value: unset' })
  pureAttr Href _ = unsafeAttribute $ This { key: "href", value: unset' }
  unpureAttr Href eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "href", value: unset' }
