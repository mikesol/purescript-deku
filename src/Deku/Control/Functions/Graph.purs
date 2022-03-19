-- | These functions uses the `GraphIsRenderable` typeclass to assert that an dom graph is renderable by the web dom engine. This means, amongst other things, that it has a unique output device (ie speaker), that it does not have any dangling units not connected to a loudspeaker, etc.
module Deku.Control.Functions.Graph
  ( makeScene
  , makeSceneFlipped
  , makeSceneR
  , makeSceneRFlipped
  , makeSceneR'
  , makeSceneR'Flipped
  , startUsing
  , startUsingWithHint
  , loopUsingScene
  , loopUsingSceneWithRes
  , loop
  , iloop
  , branch
  , ibranch
  , istart
  , freeze
  , (@>)
  , (@!>)
  , (@|>)
  , (@||>)
  , (<@)
  , (<|@)
  , (<||@)
  ) where

import Prelude

import Data.Either (Either)
import Effect (Effect)
import Deku.Change (class Change)
import Deku.Control.Functions (class GraphHint)
import Deku.Control.Functions as Functions
import Deku.Control.Indexed (IxDOM)
import Deku.Control.Types (Frame0, Scene, DOM)
import Deku.Create (class Create)
import Deku.CreateT (class CreateT)
import Deku.Interpret (class DOMInterpret)
import Deku.Patch (class GetSubgraphs, class GetTumults, class Patch, PatchInfo)
import Deku.Validation (class GraphIsRenderable)

makeScene
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => DOMInterpret dom engine
  => GraphIsRenderable graph
  => ( Either env push
       -> (push -> Effect Unit)
       -> Either (Scene env dom engine proofA push res)
            (DOM dom engine proofA res graph a)
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> Scene env dom engine proofA push res
makeScene = Functions.makeScene

infixr 6 makeScene as @>

makeSceneFlipped
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => DOMInterpret dom engine
  => GraphIsRenderable graph
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> Either (Scene env dom engine proofA push res)
            (DOM dom engine proofA res graph a)
     )
  -> Scene env dom engine proofA push res
makeSceneFlipped = Functions.makeSceneFlipped

infixr 6 makeSceneFlipped as <@

-- | Loops dom.
-- |
-- | In Deku, a "loop" is a universe whose `changeBit` increments by 1. That means that the structure of the graph is similar (no units added, none taken away) while some or none of its internal content (ie frequencies, gains, etc) has changed. This is accomplished using the `change` family of functions in `Deku.Change`.
-- |
-- | ```purescript
-- | piece :: Scene (BehavingScene Unit Unit) FFIDOM (Effect Unit) Frame0
-- | piece =
-- |   Deku.do
-- |     start -- initial frame
-- |     { time } <- env
-- |     create (scene time) $> Right unit
-- |     @> loop -- we loop by changing the scene based on `time` in the `env`
-- |         ( const
-- |             $ Deku.do
-- |                 { time } <- env
-- |                 ivoid $ change (scene time)
-- |         )
-- | ```
loop
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofB res graph a
     )
  -> DOM dom engine proofA res graph a
  -> Scene env dom engine proofA push res
loop = Functions.loop

iloop
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> a
       -> IxDOM dom engine proofB res graph graph a
     )
  -> DOM dom engine proofA res graph a
  -> Scene env dom engine proofA push res
iloop = Functions.iloop

branch
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Either env push
       -> (push -> Effect Unit)
       -> Either (Scene env dom engine proofB push res)
            (DOM dom engine proofB res graph a)
     )
  -> DOM dom engine proofA res graph a
  -> Scene env dom engine proofA push res
branch = Functions.branch

ibranch
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . Either env push
       -> (push -> Effect Unit)
       -> a
       -> Either
            ( DOM dom engine proofB res graph a
              -> Scene env dom engine proofB push res
            )
            (IxDOM dom engine proofB res graph graph a)
     )
  -> DOM dom engine proofA res graph a
  -> Scene env dom engine proofA push res
ibranch = Functions.ibranch

istart
  :: forall env dom engine push res graph a
   . GraphIsRenderable graph
  => Monoid res
  => DOMInterpret dom engine
  => ( Either env push
       -> (push -> Effect Unit)
       -> IxDOM dom engine Frame0 res () graph a
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> Scene env dom engine Frame0 push res
istart = Functions.istart

infixr 6 istart as @!>

startUsing
  :: forall env dom engine push res subgraphs tumults graph control
   . Monoid res
  => DOMInterpret dom engine
  => GraphIsRenderable graph
  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => Patch subgraphs tumults () graph
  => PatchInfo subgraphs tumults
  -> (Either env push -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> Scene env dom engine proofA push res
     )
  -> Scene env dom engine Frame0 push res
startUsing = Functions.startUsing

startUsingWithHint
  :: forall env dom engine push res hintable hint subgraphs tumults graph
       control
   . Monoid res
  => DOMInterpret dom engine
  => GraphIsRenderable graph
  => GraphHint hintable hint
  => CreateT hint () graph
  => GetSubgraphs graph subgraphs
  => GetTumults graph tumults
  => Patch subgraphs tumults () graph
  => hintable
  -> PatchInfo subgraphs tumults
  -> (Either env push -> (push -> Effect Unit) -> control)
  -> ( forall proofA
        . DOM dom engine proofA res graph control
       -> Scene env dom engine proofA push res
     )
  -> Scene env dom engine Frame0 push res
startUsingWithHint = Functions.startUsingWithHint

loopUsingScene
  :: forall env dom engine push res scene graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create scene () graph
  => Change scene graph
  => GraphIsRenderable graph
  => ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control }
     )
  -> (Either env push -> (push -> Effect Unit) -> control)
  -> Scene env dom engine Frame0 push res
loopUsingScene = Functions.loopUsingScene

loopUsingSceneWithRes
  :: forall env dom engine push res scene graph control
   . Monoid res
  => DOMInterpret dom engine
  => Create scene () graph
  => Change scene graph
  => GraphIsRenderable graph
  => ( Either env push
       -> (push -> Effect Unit)
       -> control
       -> { scene :: { | scene }, control :: control, res :: res }
     )
  -> (Either env push -> (push -> Effect Unit) -> control)
  -> Scene env dom engine Frame0 push res
loopUsingSceneWithRes = Functions.loopUsingSceneWithRes

freeze
  :: forall env dom engine proof push res graph x
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => DOM dom engine proof res graph x
  -> Scene env dom engine proof push res
freeze = Functions.freeze

makeSceneR
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph a
     )
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> Scene env dom engine proofA push res
makeSceneR = Functions.makeSceneR

infixr 6 makeSceneR as @|>

makeSceneRFlipped
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> ( Either env push
       -> (push -> Effect Unit)
       -> DOM dom engine proofA res graph a
     )
  -> Scene env dom engine proofA push res
makeSceneRFlipped = Functions.makeSceneRFlipped

infixr 6 makeSceneRFlipped as <|@

makeSceneR'
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => DOM dom engine proofA res graph a
  -> ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> Scene env dom engine proofA push res
makeSceneR' = Functions.makeSceneR'

infixr 6 makeSceneR' as @||>

makeSceneR'Flipped
  :: forall env dom engine proofA push res graph a
   . Monoid res
  => GraphIsRenderable graph
  => DOMInterpret dom engine
  => ( forall proofB
        . DOM dom engine proofB res graph a
       -> Scene env dom engine proofB push res
     )
  -> DOM dom engine proofA res graph a
  -> Scene env dom engine proofA push res
makeSceneR'Flipped = Functions.makeSceneR'Flipped

infixr 6 makeSceneR'Flipped as <||@
