import React from 'react';
import Lottie from 'react-lottie';
import animationData from '../assets/animation.json';

const Drawer = () => {
  const defaultOptions = {
    loop: true,
    autoplay: true,
    animationData: animationData,
    rendererSettings: {
      preserveAspectRatio: 'xMidYMid slice'
    }
  };

  return (
    <div className="drawer">
      <Lottie options={defaultOptions} height={100} width={100} />
    </div>
  );
};

export default Drawer;
