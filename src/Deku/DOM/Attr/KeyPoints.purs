module Deku.DOM.Attr.KeyPoints where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyPoints = KeyPoints

instance Attr AnimateMotion_ KeyPoints (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeyPoints bothValues = unsafeAttribute $ Both (pure 
    { key: "keyPoints", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keyPoints", value: prop' value })
instance Attr AnimateMotion_ KeyPoints  String  where
  attr KeyPoints value = unsafeAttribute $ This $ pure $
    { key: "keyPoints", value: prop' value }
instance Attr AnimateMotion_ KeyPoints (Event.Event  String ) where
  attr KeyPoints eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyPoints", value: prop' value }

instance Attr everything KeyPoints (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KeyPoints bothValues = unsafeAttribute $ Both (pure 
    { key: "keyPoints", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyPoints", value: unset' })
instance Attr everything KeyPoints  Unit  where
  attr KeyPoints _ = unsafeAttribute $ This $ pure $
    { key: "keyPoints", value: unset' }
instance Attr everything KeyPoints (Event.Event  Unit ) where
  attr KeyPoints eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keyPoints", value: unset' }
