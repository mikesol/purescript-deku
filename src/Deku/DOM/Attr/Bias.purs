module Deku.DOM.Attr.Bias where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bias bothValues = unsafeAttribute $ Both (pure 
    { key: "bias", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bias", value: prop' value })
instance Attr FeConvolveMatrix_ Bias  String  where
  attr Bias value = unsafeAttribute $ This $ pure $
    { key: "bias", value: prop' value }
instance Attr FeConvolveMatrix_ Bias (Event.Event  String ) where
  attr Bias eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "bias", value: prop' value }

instance Attr everything Bias (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Bias bothValues = unsafeAttribute $ Both (pure  { key: "bias", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "bias", value: unset' })
instance Attr everything Bias  Unit  where
  attr Bias _ = unsafeAttribute $ This $ pure $ { key: "bias", value: unset' }
instance Attr everything Bias (Event.Event  Unit ) where
  attr Bias eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "bias", value: unset' }
