module Deku.DOM.Attr.OnProgress where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnProgress = OnProgress

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "progress", value: cb' value })
instance Attr anything OnProgress  Cb  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' value }
instance Attr anything OnProgress (Event.Event  Cb ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' value }

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnProgress  (Effect Unit)  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnProgress (Event.Event  (Effect Unit) ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnProgress  (Effect Boolean)  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' (Cb (const value)) }
instance Attr anything OnProgress (Event.Event  (Effect Boolean) ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const value)) }

type OnProgressEffect =
  forall element
   . Attr element OnProgress (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnProgress (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "progress", value: unset' })
instance Attr everything OnProgress  Unit  where
  attr OnProgress _ = unsafeAttribute $ This $ pure $
    { key: "progress", value: unset' }
instance Attr everything OnProgress (Event.Event  Unit ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "progress", value: unset' }
