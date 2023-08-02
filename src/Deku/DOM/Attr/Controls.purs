module Deku.DOM.Attr.Controls where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Controls = Controls

instance Attr Audio_ Controls (NonEmpty.NonEmpty Event.Event  String ) where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Audio_ Controls  String  where
  attr Controls value = unsafeAttribute $ This
    { key: "controls", value: prop' value }
instance Attr Audio_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr Video_ Controls (NonEmpty.NonEmpty Event.Event  String ) where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "controls", value: prop' value })
instance Attr Video_ Controls  String  where
  attr Controls value = unsafeAttribute $ This
    { key: "controls", value: prop' value }
instance Attr Video_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "controls", value: prop' value }

instance Attr everything Controls (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Controls bothValues = unsafeAttribute $ Both
    { key: "controls", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "controls", value: unset' })
instance Attr everything Controls  Unit  where
  attr Controls _ = unsafeAttribute $ This
    { key: "controls", value: unset' }
instance Attr everything Controls (Event.Event  Unit ) where
  attr Controls eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "controls", value: unset' }
