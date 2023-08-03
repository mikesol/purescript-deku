module Deku.DOM.Attr.Srcset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcset = Srcset

instance Attr Img_ Srcset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srcset bothValues = unsafeAttribute $ Both
    { key: "srcset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "srcset", value: prop' value })
instance Attr Img_ Srcset  String  where
  attr Srcset value = unsafeAttribute $ This $ pure $
    { key: "srcset", value: prop' value }
instance Attr Img_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srcset", value: prop' value }

instance Attr Source_ Srcset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srcset bothValues = unsafeAttribute $ Both
    { key: "srcset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "srcset", value: prop' value })
instance Attr Source_ Srcset  String  where
  attr Srcset value = unsafeAttribute $ This $ pure $
    { key: "srcset", value: prop' value }
instance Attr Source_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srcset", value: prop' value }

instance Attr everything Srcset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Srcset bothValues = unsafeAttribute $ Both
    { key: "srcset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "srcset", value: unset' })
instance Attr everything Srcset  Unit  where
  attr Srcset _ = unsafeAttribute $ This $ pure $ { key: "srcset", value: unset' }
instance Attr everything Srcset (Event.Event  Unit ) where
  attr Srcset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srcset", value: unset' }
