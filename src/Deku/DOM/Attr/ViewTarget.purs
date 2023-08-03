module Deku.DOM.Attr.ViewTarget where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget (NonEmpty.NonEmpty Event.Event  String ) where
  attr ViewTarget bothValues = unsafeAttribute $ Both
    { key: "viewTarget", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "viewTarget", value: prop' value })
instance Attr View_ ViewTarget  String  where
  attr ViewTarget value = unsafeAttribute $ This $ pure $
    { key: "viewTarget", value: prop' value }
instance Attr View_ ViewTarget (Event.Event  String ) where
  attr ViewTarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "viewTarget", value: prop' value }

instance Attr everything ViewTarget (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ViewTarget bothValues = unsafeAttribute $ Both
    { key: "viewTarget", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "viewTarget", value: unset' })
instance Attr everything ViewTarget  Unit  where
  attr ViewTarget _ = unsafeAttribute $ This $ pure $
    { key: "viewTarget", value: unset' }
instance Attr everything ViewTarget (Event.Event  Unit ) where
  attr ViewTarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "viewTarget", value: unset' }
