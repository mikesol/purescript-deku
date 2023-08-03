module Deku.DOM.Attr.Async where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Async = Async

instance Attr Script_ Async (NonEmpty.NonEmpty Event.Event  String ) where
  attr Async bothValues = unsafeAttribute $ Both (pure 
    { key: "async", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "async", value: prop' value })
instance Attr Script_ Async  String  where
  attr Async value = unsafeAttribute $ This $ pure $
    { key: "async", value: prop' value }
instance Attr Script_ Async (Event.Event  String ) where
  attr Async eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "async", value: prop' value }

instance Attr everything Async (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Async bothValues = unsafeAttribute $ Both (pure  { key: "async", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "async", value: unset' })
instance Attr everything Async  Unit  where
  attr Async _ = unsafeAttribute $ This $ pure $ { key: "async", value: unset' }
instance Attr everything Async (Event.Event  Unit ) where
  attr Async eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "async", value: unset' }
