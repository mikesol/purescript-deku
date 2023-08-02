module Deku.DOM.Attr.HttpEquiv where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data HttpEquiv = HttpEquiv

instance Attr Meta_ HttpEquiv (NonEmpty.NonEmpty Event.Event  String ) where
  attr HttpEquiv bothValues = unsafeAttribute $ Both
    { key: "http-equiv", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "http-equiv", value: prop' value })
instance Attr Meta_ HttpEquiv  String  where
  attr HttpEquiv value = unsafeAttribute $ This
    { key: "http-equiv", value: prop' value }
instance Attr Meta_ HttpEquiv (Event.Event  String ) where
  attr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "http-equiv", value: prop' value }

instance Attr everything HttpEquiv (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr HttpEquiv bothValues = unsafeAttribute $ Both
    { key: "http-equiv", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "http-equiv", value: unset' })
instance Attr everything HttpEquiv  Unit  where
  attr HttpEquiv _ = unsafeAttribute $ This
    { key: "http-equiv", value: unset' }
instance Attr everything HttpEquiv (Event.Event  Unit ) where
  attr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "http-equiv", value: unset' }
