module Deku.DOM.Attr.OnSeeking where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSeeking = OnSeeking

instance Attr anything OnSeeking (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSeeking bothValues = unsafeAttribute $ Both (pure 
    { key: "seeking", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "seeking", value: cb' value })
instance Attr anything OnSeeking  Cb  where
  attr OnSeeking value = unsafeAttribute $ This $ pure $
    { key: "seeking", value: cb' value }
instance Attr anything OnSeeking (Event.Event  Cb ) where
  attr OnSeeking eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeking", value: cb' value }

instance Attr anything OnSeeking (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSeeking bothValues = unsafeAttribute $ Both (pure 
    { key: "seeking", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeking", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSeeking  (Effect Unit)  where
  attr OnSeeking value = unsafeAttribute $ This $ pure $
    { key: "seeking", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeking (Event.Event  (Effect Unit) ) where
  attr OnSeeking eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeking (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSeeking bothValues = unsafeAttribute $ Both (pure 
    { key: "seeking", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeking", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSeeking  (Effect Boolean)  where
  attr OnSeeking value = unsafeAttribute $ This $ pure $
    { key: "seeking", value: cb' (Cb (const value)) }
instance Attr anything OnSeeking (Event.Event  (Effect Boolean) ) where
  attr OnSeeking eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeking", value: cb' (Cb (const value)) }

type OnSeekingEffect =
  forall element
   . Attr element OnSeeking (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeking (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSeeking bothValues = unsafeAttribute $ Both (pure 
    { key: "seeking", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "seeking", value: unset' })
instance Attr everything OnSeeking  Unit  where
  attr OnSeeking _ = unsafeAttribute $ This $ pure $
    { key: "seeking", value: unset' }
instance Attr everything OnSeeking (Event.Event  Unit ) where
  attr OnSeeking eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "seeking", value: unset' }
