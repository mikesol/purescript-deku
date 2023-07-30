module Deku.DOM.Attr.Crossorigin where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Crossorigin = Crossorigin

instance Attr Audio_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Img_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Link_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Script_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Video_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr Image_ Crossorigin String where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "crossorigin", value: prop' value })
  pureAttr Crossorigin value = unsafeAttribute $ This
    { key: "crossorigin", value: prop' value }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }

instance Attr everything Crossorigin Unit where
  attr Crossorigin bothValues = unsafeAttribute $ Both
    { key: "crossorigin", value: unset' }
    (snd bothValues <#> \_ -> { key: "crossorigin", value: unset' })
  pureAttr Crossorigin _ = unsafeAttribute $ This
    { key: "crossorigin", value: unset' }
  unpureAttr Crossorigin eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "crossorigin", value: unset' }
