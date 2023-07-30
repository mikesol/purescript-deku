module Deku.DOM.Attr.Media where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Media = Media

instance Attr A_ Media String where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "media", value: prop' value })
  pureAttr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Area_ Media String where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "media", value: prop' value })
  pureAttr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Link_ Media String where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "media", value: prop' value })
  pureAttr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Source_ Media String where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "media", value: prop' value })
  pureAttr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Style_ Media String where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "media", value: prop' value })
  pureAttr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr everything Media Unit where
  attr Media bothValues = unsafeAttribute $ Both { key: "media", value: unset' }
    (snd bothValues <#> \_ -> { key: "media", value: unset' })
  pureAttr Media _ = unsafeAttribute $ This { key: "media", value: unset' }
  unpureAttr Media eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "media", value: unset' }
