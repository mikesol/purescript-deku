module Deku.DOM.Attr.TargetX where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX (NonEmpty.NonEmpty Event.Event  String ) where
  attr TargetX bothValues = unsafeAttribute $ Both
    { key: "targetX", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "targetX", value: prop' value })
instance Attr FeConvolveMatrix_ TargetX  String  where
  attr TargetX value = unsafeAttribute $ This $ pure $
    { key: "targetX", value: prop' value }
instance Attr FeConvolveMatrix_ TargetX (Event.Event  String ) where
  attr TargetX eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "targetX", value: prop' value }

instance Attr everything TargetX (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TargetX bothValues = unsafeAttribute $ Both
    { key: "targetX", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "targetX", value: unset' })
instance Attr everything TargetX  Unit  where
  attr TargetX _ = unsafeAttribute $ This $ pure $ { key: "targetX", value: unset' }
instance Attr everything TargetX (Event.Event  Unit ) where
  attr TargetX eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "targetX", value: unset' }
