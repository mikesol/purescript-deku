module Deku.DOM.Attr.Action where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Action = Action

instance Attr Form_ Action (NonEmpty.NonEmpty Event.Event  String ) where
  attr Action bothValues = unsafeAttribute $ Both
    { key: "action", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "action", value: prop' value })
instance Attr Form_ Action  String  where
  attr Action value = unsafeAttribute $ This $ pure $
    { key: "action", value: prop' value }
instance Attr Form_ Action (Event.Event  String ) where
  attr Action eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "action", value: prop' value }

instance Attr everything Action (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Action bothValues = unsafeAttribute $ Both
    { key: "action", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "action", value: unset' })
instance Attr everything Action  Unit  where
  attr Action _ = unsafeAttribute $ This $ pure $ { key: "action", value: unset' }
instance Attr everything Action (Event.Event  Unit ) where
  attr Action eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "action", value: unset' }
