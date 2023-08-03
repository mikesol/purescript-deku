module Deku.DOM.Attr.Datetime where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime (NonEmpty.NonEmpty Event.Event  String ) where
  attr Datetime bothValues = unsafeAttribute $ Both (pure 
    { key: "datetime", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
instance Attr Del_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ This $ pure $
    { key: "datetime", value: prop' value }
instance Attr Del_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr Ins_ Datetime (NonEmpty.NonEmpty Event.Event  String ) where
  attr Datetime bothValues = unsafeAttribute $ Both (pure 
    { key: "datetime", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
instance Attr Ins_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ This $ pure $
    { key: "datetime", value: prop' value }
instance Attr Ins_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr Time_ Datetime (NonEmpty.NonEmpty Event.Event  String ) where
  attr Datetime bothValues = unsafeAttribute $ Both (pure 
    { key: "datetime", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
instance Attr Time_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ This $ pure $
    { key: "datetime", value: prop' value }
instance Attr Time_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr everything Datetime (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Datetime bothValues = unsafeAttribute $ Both (pure 
    { key: "datetime", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "datetime", value: unset' })
instance Attr everything Datetime  Unit  where
  attr Datetime _ = unsafeAttribute $ This $ pure $
    { key: "datetime", value: unset' }
instance Attr everything Datetime (Event.Event  Unit ) where
  attr Datetime eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "datetime", value: unset' }
