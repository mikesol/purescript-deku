module Deku.DOM.Attr.OnError where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnError = OnError

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnError bothValues = unsafeAttribute $ Both
    { key: "error", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "error", value: cb' value })
instance Attr anything OnError  Cb  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' value }
instance Attr anything OnError (Event.Event  Cb ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' value }

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnError bothValues = unsafeAttribute $ Both
    { key: "error", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnError  (Effect Unit)  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnError (Event.Event  (Effect Unit) ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnError bothValues = unsafeAttribute $ Both
    { key: "error", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const value)) }
    )
instance Attr anything OnError  (Effect Boolean)  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' (Cb (const value)) }
instance Attr anything OnError (Event.Event  (Effect Boolean) ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const value)) }

type OnErrorEffect =
  forall element
   . Attr element OnError (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnError (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnError bothValues = unsafeAttribute $ Both
    { key: "error", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "error", value: unset' })
instance Attr everything OnError  Unit  where
  attr OnError _ = unsafeAttribute $ This $ pure $ { key: "error", value: unset' }
instance Attr everything OnError (Event.Event  Unit ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "error", value: unset' }
