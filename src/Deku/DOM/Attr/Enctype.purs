module Deku.DOM.Attr.Enctype where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enctype = Enctype

instance Attr Form_ Enctype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Enctype bothValues = unsafeAttribute $ Both
    { key: "enctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "enctype", value: prop' value })
instance Attr Form_ Enctype  String  where
  attr Enctype value = unsafeAttribute $ This $ pure $
    { key: "enctype", value: prop' value }
instance Attr Form_ Enctype (Event.Event  String ) where
  attr Enctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "enctype", value: prop' value }

instance Attr everything Enctype (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Enctype bothValues = unsafeAttribute $ Both
    { key: "enctype", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "enctype", value: unset' })
instance Attr everything Enctype  Unit  where
  attr Enctype _ = unsafeAttribute $ This $ pure $ { key: "enctype", value: unset' }
instance Attr everything Enctype (Event.Event  Unit ) where
  attr Enctype eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "enctype", value: unset' }
