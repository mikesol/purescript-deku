module Deku.DOM.Attr.Language where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Language = Language

instance Attr Script_ Language (NonEmpty.NonEmpty Event.Event  String ) where
  attr Language bothValues = unsafeAttribute $ Both (pure 
    { key: "language", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "language", value: prop' value })
instance Attr Script_ Language  String  where
  attr Language value = unsafeAttribute $ This $ pure $
    { key: "language", value: prop' value }
instance Attr Script_ Language (Event.Event  String ) where
  attr Language eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "language", value: prop' value }

instance Attr everything Language (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Language bothValues = unsafeAttribute $ Both (pure 
    { key: "language", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "language", value: unset' })
instance Attr everything Language  Unit  where
  attr Language _ = unsafeAttribute $ This $ pure $
    { key: "language", value: unset' }
instance Attr everything Language (Event.Event  Unit ) where
  attr Language eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "language", value: unset' }
