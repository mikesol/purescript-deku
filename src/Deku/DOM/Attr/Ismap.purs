module Deku.DOM.Attr.Ismap where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ismap = Ismap

instance Attr Img_ Ismap (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ismap bothValues = unsafeAttribute $ Both
    { key: "ismap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "ismap", value: prop' value })
instance Attr Img_ Ismap  String  where
  attr Ismap value = unsafeAttribute $ This
    { key: "ismap", value: prop' value }
instance Attr Img_ Ismap (Event.Event  String ) where
  attr Ismap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ismap", value: prop' value }

instance Attr everything Ismap (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Ismap bothValues = unsafeAttribute $ Both { key: "ismap", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "ismap", value: unset' })
instance Attr everything Ismap  Unit  where
  attr Ismap _ = unsafeAttribute $ This { key: "ismap", value: unset' }
instance Attr everything Ismap (Event.Event  Unit ) where
  attr Ismap eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ismap", value: unset' }
