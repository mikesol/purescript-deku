module Deku.DOM.Attr.OnScroll where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnScroll = OnScroll

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnScroll bothValues = unsafeAttribute $ Both
    { key: "scroll", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "scroll", value: cb' value })
instance Attr anything OnScroll  Cb  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' value }
instance Attr anything OnScroll (Event.Event  Cb ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' value }

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnScroll bothValues = unsafeAttribute $ Both
    { key: "scroll", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnScroll  (Effect Unit)  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnScroll (Event.Event  (Effect Unit) ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnScroll bothValues = unsafeAttribute $ Both
    { key: "scroll", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "scroll", value: cb' (Cb (const value)) }
    )
instance Attr anything OnScroll  (Effect Boolean)  where
  attr OnScroll value = unsafeAttribute $ This $ pure $
    { key: "scroll", value: cb' (Cb (const value)) }
instance Attr anything OnScroll (Event.Event  (Effect Boolean) ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scroll", value: cb' (Cb (const value)) }

type OnScrollEffect =
  forall element
   . Attr element OnScroll (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnScroll (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnScroll bothValues = unsafeAttribute $ Both
    { key: "scroll", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "scroll", value: unset' })
instance Attr everything OnScroll  Unit  where
  attr OnScroll _ = unsafeAttribute $ This $ pure $ { key: "scroll", value: unset' }
instance Attr everything OnScroll (Event.Event  Unit ) where
  attr OnScroll eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scroll", value: unset' }
