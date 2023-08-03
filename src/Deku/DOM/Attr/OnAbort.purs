module Deku.DOM.Attr.OnAbort where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAbort = OnAbort

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "abort", value: cb' value })
instance Attr anything OnAbort  Cb  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' value }
instance Attr anything OnAbort (Event.Event  Cb ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' value }

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAbort  (Effect Unit)  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAbort (Event.Event  (Effect Unit) ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "abort", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAbort  (Effect Boolean)  where
  attr OnAbort value = unsafeAttribute $ This $ pure $
    { key: "abort", value: cb' (Cb (const value)) }
instance Attr anything OnAbort (Event.Event  (Effect Boolean) ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "abort", value: cb' (Cb (const value)) }

type OnAbortEffect =
  forall element
   . Attr element OnAbort (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAbort (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAbort bothValues = unsafeAttribute $ Both (pure 
    { key: "abort", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "abort", value: unset' })
instance Attr everything OnAbort  Unit  where
  attr OnAbort _ = unsafeAttribute $ This $ pure $ { key: "abort", value: unset' }
instance Attr everything OnAbort (Event.Event  Unit ) where
  attr OnAbort eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "abort", value: unset' }
