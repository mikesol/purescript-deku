module Deku.DOM.Attr.Azimuth where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Azimuth = Azimuth

instance Attr FeDistantLight_ Azimuth String where
  attr Azimuth bothValues = unsafeAttribute $ Both
    { key: "azimuth", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "azimuth", value: prop' value })
  pureAttr Azimuth value = unsafeAttribute $ This
    { key: "azimuth", value: prop' value }
  unpureAttr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "azimuth", value: prop' value }

instance Attr everything Azimuth Unit where
  attr Azimuth bothValues = unsafeAttribute $ Both
    { key: "azimuth", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "azimuth", value: unset' })
  pureAttr Azimuth _ = unsafeAttribute $ This { key: "azimuth", value: unset' }
  unpureAttr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "azimuth", value: unset' }
