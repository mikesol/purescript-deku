module Deku.DOM.Attr.Importance where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Importance = Importance

instance Attr Iframe_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Iframe_ Importance  String  where
  attr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
instance Attr Iframe_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Img_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Img_ Importance  String  where
  attr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
instance Attr Img_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Link_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Link_ Importance  String  where
  attr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
instance Attr Link_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr Script_ Importance (NonEmpty.NonEmpty Event.Event  String ) where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "importance", value: prop' value })
instance Attr Script_ Importance  String  where
  attr Importance value = unsafeAttribute $ This
    { key: "importance", value: prop' value }
instance Attr Script_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "importance", value: prop' value }

instance Attr everything Importance (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Importance bothValues = unsafeAttribute $ Both
    { key: "importance", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "importance", value: unset' })
instance Attr everything Importance  Unit  where
  attr Importance _ = unsafeAttribute $ This
    { key: "importance", value: unset' }
instance Attr everything Importance (Event.Event  Unit ) where
  attr Importance eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "importance", value: unset' }
