module Deku.DOM.Attr.OnDragleave where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDragleave = OnDragleave

instance Attr anything OnDragleave (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragleave bothValues = unsafeAttribute $ Both (pure 
    { key: "dragleave", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dragleave", value: cb' value })
instance Attr anything OnDragleave  Cb  where
  attr OnDragleave value = unsafeAttribute $ This $ pure $
    { key: "dragleave", value: cb' value }
instance Attr anything OnDragleave (Event.Event  Cb ) where
  attr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' value }

instance Attr anything OnDragleave (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragleave bothValues = unsafeAttribute $ Both (pure 
    { key: "dragleave", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragleave", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragleave  (Effect Unit)  where
  attr OnDragleave value = unsafeAttribute $ This $ pure $
    { key: "dragleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragleave (Event.Event  (Effect Unit) ) where
  attr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragleave (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragleave bothValues = unsafeAttribute $ Both (pure 
    { key: "dragleave", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragleave", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragleave  (Effect Boolean)  where
  attr OnDragleave value = unsafeAttribute $ This $ pure $
    { key: "dragleave", value: cb' (Cb (const value)) }
instance Attr anything OnDragleave (Event.Event  (Effect Boolean) ) where
  attr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const value)) }

type OnDragleaveEffect =
  forall element
   . Attr element OnDragleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDragleave (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragleave bothValues = unsafeAttribute $ Both (pure 
    { key: "dragleave", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragleave", value: unset' })
instance Attr everything OnDragleave  Unit  where
  attr OnDragleave _ = unsafeAttribute $ This $ pure $
    { key: "dragleave", value: unset' }
instance Attr everything OnDragleave (Event.Event  Unit ) where
  attr OnDragleave eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragleave", value: unset' }
