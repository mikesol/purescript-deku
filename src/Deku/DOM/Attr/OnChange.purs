module Deku.DOM.Attr.OnChange where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnChange = OnChange

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnChange bothValues = unsafeAttribute $ Both
    { key: "change", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "change", value: cb' value })
instance Attr anything OnChange  Cb  where
  attr OnChange value = unsafeAttribute $ This
    { key: "change", value: cb' value }
instance Attr anything OnChange (Event.Event  Cb ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' value }

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnChange bothValues = unsafeAttribute $ Both
    { key: "change", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnChange  (Effect Unit)  where
  attr OnChange value = unsafeAttribute $ This
    { key: "change", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnChange (Event.Event  (Effect Unit) ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnChange bothValues = unsafeAttribute $ Both
    { key: "change", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "change", value: cb' (Cb (const value)) }
    )
instance Attr anything OnChange  (Effect Boolean)  where
  attr OnChange value = unsafeAttribute $ This
    { key: "change", value: cb' (Cb (const value)) }
instance Attr anything OnChange (Event.Event  (Effect Boolean) ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "change", value: cb' (Cb (const value)) }

type OnChangeEffect =
  forall element
   . Attr element OnChange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnChange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnChange bothValues = unsafeAttribute $ Both
    { key: "change", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "change", value: unset' })
instance Attr everything OnChange  Unit  where
  attr OnChange _ = unsafeAttribute $ This { key: "change", value: unset' }
instance Attr everything OnChange (Event.Event  Unit ) where
  attr OnChange eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "change", value: unset' }
