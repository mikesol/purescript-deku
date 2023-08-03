module Deku.DOM.Attr.Preload where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Preload = Preload

instance Attr Audio_ Preload (NonEmpty.NonEmpty Event.Event  String ) where
  attr Preload bothValues = unsafeAttribute $ Both
    { key: "preload", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Audio_ Preload  String  where
  attr Preload value = unsafeAttribute $ This $ pure $
    { key: "preload", value: prop' value }
instance Attr Audio_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preload", value: prop' value }

instance Attr Video_ Preload (NonEmpty.NonEmpty Event.Event  String ) where
  attr Preload bothValues = unsafeAttribute $ Both
    { key: "preload", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Video_ Preload  String  where
  attr Preload value = unsafeAttribute $ This $ pure $
    { key: "preload", value: prop' value }
instance Attr Video_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preload", value: prop' value }

instance Attr everything Preload (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Preload bothValues = unsafeAttribute $ Both
    { key: "preload", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "preload", value: unset' })
instance Attr everything Preload  Unit  where
  attr Preload _ = unsafeAttribute $ This $ pure $ { key: "preload", value: unset' }
instance Attr everything Preload (Event.Event  Unit ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "preload", value: unset' }
