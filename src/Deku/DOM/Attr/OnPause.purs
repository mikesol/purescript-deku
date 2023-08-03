module Deku.DOM.Attr.OnPause where

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

data OnPause = OnPause

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPause bothValues = unsafeAttribute $ Both (pure 
    { key: "pause", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pause", value: cb' value })
instance Attr anything OnPause (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPause (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pause", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pause", value: cb' value })
instance Attr anything OnPause  Cb  where
  attr OnPause value = unsafeAttribute $ This $ pure $
    { key: "pause", value: cb' value }
instance Attr anything OnPause (Event.Event  Cb ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' value }

instance Attr anything OnPause (ST.ST Global.Global  Cb ) where
  attr OnPause stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pause", value: cb' value }

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPause bothValues = unsafeAttribute $ Both (pure 
    { key: "pause", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPause (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPause (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pause", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPause  (Effect Unit)  where
  attr OnPause value = unsafeAttribute $ This $ pure $
    { key: "pause", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPause (Event.Event  (Effect Unit) ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPause stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPause bothValues = unsafeAttribute $ Both (pure 
    { key: "pause", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPause (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPause (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pause", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPause  (Effect Boolean)  where
  attr OnPause value = unsafeAttribute $ This $ pure $
    { key: "pause", value: cb' (Cb (const value)) }
instance Attr anything OnPause (Event.Event  (Effect Boolean) ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) }

instance Attr anything OnPause (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPause stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) }

instance Attr everything OnPause (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPause bothValues = unsafeAttribute $ Both (pure 
    { key: "pause", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pause", value: unset' })
instance Attr everything OnPause (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPause (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pause", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pause", value: unset' })
instance Attr everything OnPause  Unit  where
  attr OnPause _ = unsafeAttribute $ This $ pure $ { key: "pause", value: unset' }
instance Attr everything OnPause (Event.Event  Unit ) where
  attr OnPause eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pause", value: unset' }

instance Attr everything OnPause (ST.ST Global.Global  Unit ) where
  attr OnPause stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "pause", value: unset' }
