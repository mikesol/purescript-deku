module Deku.DOM.Attr.Loading where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loading = Loading

instance Attr Img_ Loading (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Img_ Loading  String  where
  attr Loading value = unsafeAttribute $ This $ pure $
    { key: "loading", value: prop' value }
instance Attr Img_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr Iframe_ Loading (NonEmpty.NonEmpty Event.Event  String ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loading", value: prop' value })
instance Attr Iframe_ Loading  String  where
  attr Loading value = unsafeAttribute $ This $ pure $
    { key: "loading", value: prop' value }
instance Attr Iframe_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loading", value: prop' value }

instance Attr everything Loading (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Loading bothValues = unsafeAttribute $ Both (pure 
    { key: "loading", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loading", value: unset' })
instance Attr everything Loading  Unit  where
  attr Loading _ = unsafeAttribute $ This $ pure $ { key: "loading", value: unset' }
instance Attr everything Loading (Event.Event  Unit ) where
  attr Loading eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "loading", value: unset' }
