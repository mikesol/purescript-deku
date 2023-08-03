module Deku.DOM.Attr.OnEnded where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnEnded = OnEnded

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ended", value: cb' value })
instance Attr anything OnEnded  Cb  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' value }
instance Attr anything OnEnded (Event.Event  Cb ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' value }

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEnded  (Effect Unit)  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEnded (Event.Event  (Effect Unit) ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEnded  (Effect Boolean)  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' (Cb (const value)) }
instance Attr anything OnEnded (Event.Event  (Effect Boolean) ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) }

type OnEndedEffect =
  forall element
   . Attr element OnEnded (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEnded (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ended", value: unset' })
instance Attr everything OnEnded  Unit  where
  attr OnEnded _ = unsafeAttribute $ This $ pure $ { key: "ended", value: unset' }
instance Attr everything OnEnded (Event.Event  Unit ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ended", value: unset' }
