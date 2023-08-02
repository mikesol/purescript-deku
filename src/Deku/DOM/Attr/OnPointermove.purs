module Deku.DOM.Attr.OnPointermove where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointermove = OnPointermove

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointermove", value: cb' value })
instance Attr anything OnPointermove  Cb  where
  attr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' value }
instance Attr anything OnPointermove (Event.Event  Cb ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointermove  (Effect Unit)  where
  attr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointermove (Event.Event  (Effect Unit) ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointermove  (Effect Boolean)  where
  attr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' (Cb (const value)) }
instance Attr anything OnPointermove (Event.Event  (Effect Boolean) ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) }

type OnPointermoveEffect =
  forall element
   . Attr element OnPointermove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointermove (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointermove", value: unset' })
instance Attr everything OnPointermove  Unit  where
  attr OnPointermove _ = unsafeAttribute $ This
    { key: "pointermove", value: unset' }
instance Attr everything OnPointermove (Event.Event  Unit ) where
  attr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointermove", value: unset' }
