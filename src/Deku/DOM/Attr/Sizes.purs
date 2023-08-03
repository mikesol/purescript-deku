module Deku.DOM.Attr.Sizes where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sizes = Sizes

instance Attr Link_ Sizes (NonEmpty.NonEmpty Event.Event  String ) where
  attr Sizes bothValues = unsafeAttribute $ Both (pure 
    { key: "sizes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
instance Attr Link_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ This $ pure $
    { key: "sizes", value: prop' value }
instance Attr Link_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr Img_ Sizes (NonEmpty.NonEmpty Event.Event  String ) where
  attr Sizes bothValues = unsafeAttribute $ Both (pure 
    { key: "sizes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
instance Attr Img_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ This $ pure $
    { key: "sizes", value: prop' value }
instance Attr Img_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr Source_ Sizes (NonEmpty.NonEmpty Event.Event  String ) where
  attr Sizes bothValues = unsafeAttribute $ Both (pure 
    { key: "sizes", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "sizes", value: prop' value })
instance Attr Source_ Sizes  String  where
  attr Sizes value = unsafeAttribute $ This $ pure $
    { key: "sizes", value: prop' value }
instance Attr Source_ Sizes (Event.Event  String ) where
  attr Sizes eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "sizes", value: prop' value }

instance Attr everything Sizes (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Sizes bothValues = unsafeAttribute $ Both (pure  { key: "sizes", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "sizes", value: unset' })
instance Attr everything Sizes  Unit  where
  attr Sizes _ = unsafeAttribute $ This $ pure $ { key: "sizes", value: unset' }
instance Attr everything Sizes (Event.Event  Unit ) where
  attr Sizes eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "sizes", value: unset' }
