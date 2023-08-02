module Deku.DOM.Attr.Usemap where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Usemap = Usemap

instance Attr Img_ Usemap (NonEmpty.NonEmpty Event.Event  String ) where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
instance Attr Img_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
instance Attr Img_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr Input_ Usemap (NonEmpty.NonEmpty Event.Event  String ) where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
instance Attr Input_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
instance Attr Input_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr Object_ Usemap (NonEmpty.NonEmpty Event.Event  String ) where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "usemap", value: prop' value })
instance Attr Object_ Usemap  String  where
  attr Usemap value = unsafeAttribute $ This
    { key: "usemap", value: prop' value }
instance Attr Object_ Usemap (Event.Event  String ) where
  attr Usemap eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "usemap", value: prop' value }

instance Attr everything Usemap (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Usemap bothValues = unsafeAttribute $ Both
    { key: "usemap", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "usemap", value: unset' })
instance Attr everything Usemap  Unit  where
  attr Usemap _ = unsafeAttribute $ This { key: "usemap", value: unset' }
instance Attr everything Usemap (Event.Event  Unit ) where
  attr Usemap eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "usemap", value: unset' }
