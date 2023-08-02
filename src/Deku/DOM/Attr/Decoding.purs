module Deku.DOM.Attr.Decoding where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decoding = Decoding

instance Attr Img_ Decoding (NonEmpty.NonEmpty Event.Event  String ) where
  attr Decoding bothValues = unsafeAttribute $ Both
    { key: "decoding", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "decoding", value: prop' value })
instance Attr Img_ Decoding  String  where
  attr Decoding value = unsafeAttribute $ This
    { key: "decoding", value: prop' value }
instance Attr Img_ Decoding (Event.Event  String ) where
  attr Decoding eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "decoding", value: prop' value }

instance Attr everything Decoding (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Decoding bothValues = unsafeAttribute $ Both
    { key: "decoding", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "decoding", value: unset' })
instance Attr everything Decoding  Unit  where
  attr Decoding _ = unsafeAttribute $ This
    { key: "decoding", value: unset' }
instance Attr everything Decoding (Event.Event  Unit ) where
  attr Decoding eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "decoding", value: unset' }
