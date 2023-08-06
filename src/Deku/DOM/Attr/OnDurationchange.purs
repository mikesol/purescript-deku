module Deku.DOM.Attr.OnDurationchange where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both (pure 
    { key: "durationchange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "durationchange", value: cb' value })
instance Attr anything OnDurationchange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDurationchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "durationchange", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "durationchange", value: cb' value })
instance Attr anything OnDurationchange  Cb  where
  attr OnDurationchange value = unsafeAttribute $ This $ pure $
    { key: "durationchange", value: cb' value }
instance Attr anything OnDurationchange (Event.Event  Cb ) where
  attr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "durationchange", value: cb' value }

instance Attr anything OnDurationchange (ST.ST Global.Global  Cb ) where
  attr OnDurationchange iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "durationchange", value: cb' value }

instance Attr anything OnDurationchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both (pure 
    { key: "durationchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDurationchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDurationchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "durationchange"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDurationchange  (Effect Unit)  where
  attr OnDurationchange value = unsafeAttribute $ This $ pure $
    { key: "durationchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDurationchange (Event.Event  (Effect Unit) ) where
  attr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDurationchange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDurationchange iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDurationchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both (pure 
    { key: "durationchange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDurationchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDurationchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "durationchange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "durationchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDurationchange  (Effect Boolean)  where
  attr OnDurationchange value = unsafeAttribute $ This $ pure $
    { key: "durationchange", value: cb' (Cb (const value)) }
instance Attr anything OnDurationchange (Event.Event  (Effect Boolean) ) where
  attr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "durationchange", value: cb' (Cb (const value)) }

instance Attr anything OnDurationchange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDurationchange iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "durationchange", value: cb' (Cb (const value)) }

instance Attr everything OnDurationchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDurationchange bothValues = unsafeAttribute $ Both (pure 
    { key: "durationchange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "durationchange", value: unset' })
instance Attr everything OnDurationchange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDurationchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "durationchange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "durationchange", value: unset' })
instance Attr everything OnDurationchange  Unit  where
  attr OnDurationchange _ = unsafeAttribute $ This $ pure $
    { key: "durationchange", value: unset' }
instance Attr everything OnDurationchange (Event.Event  Unit ) where
  attr OnDurationchange eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "durationchange", value: unset' }

instance Attr everything OnDurationchange (ST.ST Global.Global  Unit ) where
  attr OnDurationchange iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "durationchange", value: unset' }
