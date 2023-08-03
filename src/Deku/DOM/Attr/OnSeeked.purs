module Deku.DOM.Attr.OnSeeked where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "seeked", value: cb' value })
instance Attr anything OnSeeked  Cb  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' value }
instance Attr anything OnSeeked (Event.Event  Cb ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSeeked  (Effect Unit)  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeked (Event.Event  (Effect Unit) ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSeeked  (Effect Boolean)  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' (Cb (const value)) }
instance Attr anything OnSeeked (Event.Event  (Effect Boolean) ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const value)) }

type OnSeekedEffect =
  forall element
   . Attr element OnSeeked (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeked (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "seeked", value: unset' })
instance Attr everything OnSeeked  Unit  where
  attr OnSeeked _ = unsafeAttribute $ This $ pure $ { key: "seeked", value: unset' }
instance Attr everything OnSeeked (Event.Event  Unit ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "seeked", value: unset' }
