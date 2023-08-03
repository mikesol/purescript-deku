module Deku.DOM.Attr.PreserveAlpha where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAlpha", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "preserveAlpha", value: prop' value })
instance Attr FeConvolveMatrix_ PreserveAlpha  String  where
  attr PreserveAlpha value = unsafeAttribute $ This $ pure $
    { key: "preserveAlpha", value: prop' value }
instance Attr FeConvolveMatrix_ PreserveAlpha (Event.Event  String ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preserveAlpha", value: prop' value }

instance Attr everything PreserveAlpha (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAlpha", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "preserveAlpha", value: unset' })
instance Attr everything PreserveAlpha  Unit  where
  attr PreserveAlpha _ = unsafeAttribute $ This $ pure $
    { key: "preserveAlpha", value: unset' }
instance Attr everything PreserveAlpha (Event.Event  Unit ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "preserveAlpha", value: unset' }
