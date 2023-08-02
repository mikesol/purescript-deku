module Deku.DOM.Attr.Autoplay where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autoplay = Autoplay

instance Attr Audio_ Autoplay (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autoplay bothValues = unsafeAttribute $ Both
    { key: "autoplay", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "autoplay", value: prop' value })
instance Attr Audio_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute $ This
    { key: "autoplay", value: prop' value }
instance Attr Audio_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autoplay", value: prop' value }

instance Attr Video_ Autoplay (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autoplay bothValues = unsafeAttribute $ Both
    { key: "autoplay", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "autoplay", value: prop' value })
instance Attr Video_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute $ This
    { key: "autoplay", value: prop' value }
instance Attr Video_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autoplay", value: prop' value }

instance Attr everything Autoplay (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Autoplay bothValues = unsafeAttribute $ Both
    { key: "autoplay", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "autoplay", value: unset' })
instance Attr everything Autoplay  Unit  where
  attr Autoplay _ = unsafeAttribute $ This
    { key: "autoplay", value: unset' }
instance Attr everything Autoplay (Event.Event  Unit ) where
  attr Autoplay eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "autoplay", value: unset' }
