module Deku.DOM.Attr.Azimuth where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Azimuth = Azimuth

instance Attr FeDistantLight_ Azimuth (NonEmpty.NonEmpty Event.Event  String ) where
  attr Azimuth bothValues = unsafeAttribute $ Both
    { key: "azimuth", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "azimuth", value: prop' value })
instance Attr FeDistantLight_ Azimuth  String  where
  attr Azimuth value = unsafeAttribute $ This $ pure $
    { key: "azimuth", value: prop' value }
instance Attr FeDistantLight_ Azimuth (Event.Event  String ) where
  attr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "azimuth", value: prop' value }

instance Attr everything Azimuth (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Azimuth bothValues = unsafeAttribute $ Both
    { key: "azimuth", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "azimuth", value: unset' })
instance Attr everything Azimuth  Unit  where
  attr Azimuth _ = unsafeAttribute $ This $ pure $ { key: "azimuth", value: unset' }
instance Attr everything Azimuth (Event.Event  Unit ) where
  attr Azimuth eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "azimuth", value: unset' }
