module Deku.DOM.Attr.OnTransitionrun where

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

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionrun", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionrun", value: cb' value })
instance Attr anything OnTransitionrun (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTransitionrun (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionrun", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "transitionrun", value: cb' value })
instance Attr anything OnTransitionrun  Cb  where
  attr OnTransitionrun value = unsafeAttribute $ This $ pure $
    { key: "transitionrun", value: cb' value }
instance Attr anything OnTransitionrun (Event.Event  Cb ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (ST.ST Global.Global  Cb ) where
  attr OnTransitionrun stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionrun", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionrun (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTransitionrun (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionrun", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionrun  (Effect Unit)  where
  attr OnTransitionrun value = unsafeAttribute $ This $ pure $
    { key: "transitionrun", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Unit) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTransitionrun stValue = unsafeAttribute $ This $ stValue
    <#> \value ->
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionrun", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionrun (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "transitionrun", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionrun", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionrun  (Effect Boolean)  where
  attr OnTransitionrun value = unsafeAttribute $ This $ pure $
    { key: "transitionrun", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionrun (Event.Event  (Effect Boolean) ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) }

instance Attr anything OnTransitionrun (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTransitionrun stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "transitionrun", value: cb' (Cb (const value)) }

instance Attr everything OnTransitionrun (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionrun bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionrun", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionrun", value: unset' })
instance Attr everything OnTransitionrun (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTransitionrun (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "transitionrun", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "transitionrun", value: unset' })
instance Attr everything OnTransitionrun  Unit  where
  attr OnTransitionrun _ = unsafeAttribute $ This $ pure $
    { key: "transitionrun", value: unset' }
instance Attr everything OnTransitionrun (Event.Event  Unit ) where
  attr OnTransitionrun eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionrun", value: unset' }

instance Attr everything OnTransitionrun (ST.ST Global.Global  Unit ) where
  attr OnTransitionrun stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "transitionrun", value: unset' }
